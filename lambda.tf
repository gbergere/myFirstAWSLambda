
resource "aws_lambda_function" "my_first_lambda" {

  filename = "lambda_payload.zip"
  runtime = "python2.7"
  function_name = "tf-my-first-lambda"
  role = "${aws_iam_role.r.arn}"
  handler = "lambda_payload.lambda_handler"
  source_code_hash = "${base64sha256(file("lambda_payload.zip"))}"

  provisioner "local-exec" {
    command = "cd src && zip ../lambda_payload.zip *"
  }

}