resource "aws_cloudwatch_metric_alarm" "ec2_cpu_high" {

  alarm_name = "${var.project_name}-${var.environment}-ec2-high-cpu"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 80

  alarm_description = "Alarm when EC2 CPU utilization is above 80 percent."

  dimensions = {
    InstanceId = var.instance_id
  }

  treat_missing_data = "notBreaching"

}


resource "aws_cloudwatch_metric_alarm" "alb_unhealthy_hosts" {

  alarm_name = "${var.project_name}-${var.environment}-alb-unhealthy-hosts"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "UnHealthyHostCount"

  namespace = "AWS/ApplicationELB"

  period = 60

  statistic = "Average"

  threshold = 0

  alarm_description = "Alarm when the ALB has unhealthy targets."

  dimensions = {
    LoadBalancer = var.alb_arn_suffix
    TargetGroup  = var.target_group_arn_suffix
  }

  treat_missing_data = "notBreaching"

}


resource "aws_cloudwatch_metric_alarm" "alb_5xx_errors" {

  alarm_name = "${var.project_name}-${var.environment}-alb-5xx-errors"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "HTTPCode_ELB_5XX_Count"

  namespace = "AWS/ApplicationELB"

  period = 300

  statistic = "Sum"

  threshold = 10

  alarm_description = "Alarm when ALB returns more than 10 HTTP 5xx errors."

  dimensions = {
    LoadBalancer = var.alb_arn_suffix
  }

  treat_missing_data = "notBreaching"

}


resource "aws_cloudwatch_dashboard" "main" {

  dashboard_name = "${var.project_name}-${var.environment}-dashboard"

  dashboard_body = jsonencode({

    widgets = [

      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {

          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "InstanceId",
              var.instance_id
            ]
          ]

          period = 300

          stat = "Average"

          region = var.aws_region

          title = "EC2 CPU Utilization"

        }
      },

      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {

          metrics = [
            [
              "AWS/ApplicationELB",
              "RequestCount",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ]

          period = 300

          stat = "Sum"

          region = var.aws_region

          title = "ALB Request Count"

        }
      },

      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6

        properties = {

          metrics = [
            [
              "AWS/ApplicationELB",
              "TargetResponseTime",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ]

          period = 300

          stat = "Average"

          region = var.aws_region

          title = "ALB Target Response Time"

        }
      },

      {
        type   = "metric"
        x      = 12
        y      = 6
        width  = 12
        height = 6

        properties = {

          metrics = [
            [
              "AWS/ApplicationELB",
              "UnHealthyHostCount",
              "LoadBalancer",
              var.alb_arn_suffix,
              "TargetGroup",
              var.target_group_arn_suffix
            ]
          ]

          period = 60

          stat = "Average"

          region = var.aws_region

          title = "ALB Unhealthy Hosts"

        }
      }

    ]

  })
}