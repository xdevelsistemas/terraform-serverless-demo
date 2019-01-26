resource "aws_lambda_function" "app" {
  function_name = "${var.app_name}-${var.api_version}-${var.stage_name}"

  # The bucket name as created earlier with "aws s3api create-bucket"
  s3_bucket = "${var.app_bucket}"
  s3_key    = "${var.app_bucket_path}"

  # "main" is the filename within the zip file (main.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "${var.app_handler}"

  runtime = "${var.app_runtime_version}"

  memory_size = "${var.app_memory_size}"

  timeout = "${var.app_timeout}"

  role = "${aws_iam_role.lambda_exec.arn}"
}
