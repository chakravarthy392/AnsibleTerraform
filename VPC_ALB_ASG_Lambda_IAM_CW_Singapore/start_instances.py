import boto3

def lambda_handler(event, context):
    # Create an Auto Scaling client
    asg_client = boto3.client('autoscaling')

    # Set the desired capacity of the Auto Scaling group to 1
    asg_client.set_desired_capacity(
        AutoScalingGroupName='Demo-ASG-tf',
        DesiredCapacity=1
    )
