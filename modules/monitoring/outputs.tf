output "dashboard_name" {
  value = aws_cloudwatch_dashboard.main.dashboard_name
}

output "ec2_cpu_alarm_name" {
  value = aws_cloudwatch_metric_alarm.ec2_cpu_high.alarm_name
}

output "alb_unhealthy_hosts_alarm_name" {
  value = aws_cloudwatch_metric_alarm.alb_unhealthy_hosts.alarm_name
}

output "alb_5xx_alarm_name" {
  value = aws_cloudwatch_metric_alarm.alb_5xx_errors.alarm_name
}