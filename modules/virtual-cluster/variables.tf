variable "create" {
  description = "Controls if resources should be created (affects nearly all resources)"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "labels" {
  description = "A map of labels to add to all Kubernetes resources"
  type        = map(string)
  default     = {}
}

variable "annotations" {
  description = "A map of annotations to add to all Kubernetes resources"
  type        = map(string)
  default     = {}
}

################################################################################
# EMR Virtual Cluster
################################################################################

variable "name" {
  description = "Name of the EMR on EKS virtual cluster"
  type        = string
  default     = ""
}

variable "eks_cluster_id" {
  description = "EKS cluster ID"
  type        = string
  default     = ""
}

################################################################################
# Kubernetes Namespace + Role/Role Binding
################################################################################

variable "create_namespace" {
  description = "Determines whether a Kubernetes namespace is created for EMR on EKS"
  type        = bool
  default     = true
}

variable "namespace" {
  description = "Kubernetes namespace for EMR on EKS"
  type        = string
  default     = "emr-containers"
}

variable "create_kubernetes_role" {
  description = "Determines whether a Kubernetes role is created for EMR on EKS"
  type        = bool
  default     = true
}

################################################################################
# Job Execution Role
################################################################################

variable "create_iam_role" {
  description = "Determines whether an IAM role is created for EMR on EKS job execution role"
  type        = bool
  default     = true
}

variable "oidc_provider_arn" {
  description = "OIDC provider ARN for the EKS cluster"
  type        = string
  default     = ""
}

variable "s3_bucket_arns" {
  description = "S3 bucket ARNs for EMR on EKS job execution role to list, get objects, and put objects"
  type        = list(string)
  default     = ["*"]
}

variable "role_name" {
  description = "Name to use on IAM role created for EMR on EKS job execution role as well as Kubernetes RBAC role"
  type        = string
  default     = null
}

variable "iam_role_use_name_prefix" {
  description = "Determines whether the IAM job execution role name (`role_name`) is used as a prefix"
  type        = bool
  default     = true
}

variable "iam_role_path" {
  description = "Job execution IAM role path"
  type        = string
  default     = null
}

variable "iam_role_description" {
  description = "Description of the job execution role"
  type        = string
  default     = null
}

variable "iam_role_permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the job execution IAM role"
  type        = string
  default     = null
}

variable "iam_role_additional_policies" {
  description = "Additional policies to be added to the job execution IAM role"
  type        = any
  default     = {}
}

################################################################################
# CloudWatch Log Group
################################################################################

variable "create_cloudwatch_log_group" {
  description = "Determines whether a log group is created by this module for the cluster logs. If not, AWS will automatically create one if logging is enabled"
  type        = bool
  default     = true
}

variable "cloudwatch_log_group_arn" {
  description = "ARN of the log group to use for the cluster logs"
  type        = string
  default     = "arn:aws:logs:*:*:*"
}

variable "cloudwatch_log_group_retention_in_days" {
  description = "Number of days to retain log events. Default retention - 7 days"
  type        = number
  default     = 7
}

variable "cloudwatch_log_group_kms_key_id" {
  description = "If a KMS Key ARN is set, this key will be used to encrypt the corresponding log group. Please be sure that the KMS Key has an appropriate key policy (https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/encrypt-log-data-kms.html)"
  type        = string
  default     = null
}

variable "cloudwatch_log_group_name" {
  description = "The custom name for the AWS CloudWatch log group. If 'cloudwatch_log_group_use_name_prefix' is false or not provided, this custom name will be used. If empty, a default name will be generated."
  type        = string
  default     = null
}

variable "cloudwatch_log_group_use_name_prefix" {
  description = "Specifies whether to use a custom prefix for the log group name. If true, the log group name will have a custom prefix provided through the 'cloudwatch_log_group_name_prefix' variable."
  type        = bool
  default     = true
}

variable "cloudwatch_log_group_name_prefix" {
  description = "The custom prefix to be used for the log group name, only if 'cloudwatch_log_group_use_name_prefix' is true. If empty, a default prefix will be used."
  type        = string
  default     = null
}

variable "cloudwatch_log_group_skip_destroy" {
  description = "If true, skips the destruction of the AWS CloudWatch log group during resource removal. Use with caution, as it may lead to unintended retention of log data."
  type        = bool
  default     = false
}
