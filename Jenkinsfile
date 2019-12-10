pipeline
{

agent
{

	docker
	{
	image 'jenkinsci/blueocean'
	}
}

	
	stages
	{
	stage('Build')
	{
		steps
		{
		 echo 'Building File'
			sh 'server.js'
		}
	}
	
	}	
}
