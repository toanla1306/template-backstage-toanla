**GUIDE**
    
    1. Waiting Github action is running completely. Then access Cloudformation and Codepipeline to verify the resource is provided.
![Validate-Cloudformation-Git2S3](images/validate-cloudformation-git2s3.png)
![Validate-Codepipeline-Created](images/validate-codepipeline-created.png)

    2. In output of stack Cloudformation, copy `GitPullWebHookApi` and add that to webhook of repository.
![Add-Webhook](images/add-webhook.png)

    3. In output of stack Cloudformation, copy `PublicSSHKey` and add that to deploy key of repository.
![Amplify-Console](images/add-deploy-key.png)
    
    4. Develop and push code to master branch. We can check status of Pipeline by using Backstage template or Code Pipeline Console AWS
![Backstage-Codepipeline](images/backstage-cicd-codepipeline.png)

