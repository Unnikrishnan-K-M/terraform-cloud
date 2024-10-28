
terraform { 
  cloud { 
    
    organization = "my-aws-terraform-org" 

    workspaces { 
      name = "cli-driven-dev-workflow" 
    } 
  } 
}

resource "time_sleep" "wait_10_seconds" {
   create_duration = "10s"
}
