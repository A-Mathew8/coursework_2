pipeline
{

agent
{

	docker
	{
	image 'node:6-alpine'
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
