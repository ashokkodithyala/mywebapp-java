module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"
  
  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version

  vpc_id = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  enable_irsa = true

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access = true
  enable_cluster_creator_admin_permissions = true

  #cluster_security_group_id = aws_security_group.all_worker_mgmt.id

  eks_managed_node_group_defaults = {
    ami_type               = var.eks_ami_type
    instance_types         = var.eks_instance_types
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  }

  eks_managed_node_groups = {
    node_group = {
      min_size     = 2
      max_size     = 4
      desired_size = 2
    }
  }

 tags = {
    Environment = var.environment
    Terraform   = "true"
  }

}


data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

resource "aws_iam_policy" "worker_policy" {
  name        = "worker-policy-${local.cluster_name}"
  description = "Worker policy for the ALB Ingress"

  policy = file("iam-policy.json")
}

resource "aws_iam_role_policy_attachment" "additional" {
  for_each = module.eks.eks_managed_node_groups

  policy_arn = aws_iam_policy.worker_policy.arn
  role       = each.value.iam_role_name
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
    }
}

resource "helm_release" "ingress" {
  name       = "ingress"
  chart      = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  version    = "1.7.1"

  set {
    name  = "autoDiscoverAwsRegion"
    value = "true"
  }
  set {
    name  = "autoDiscoverAwsVpcID"
    value = "true"
  }
  set {
    name  = "clusterName"
    value = local.cluster_name
  }
}