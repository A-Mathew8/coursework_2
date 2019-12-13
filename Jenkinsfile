pipeline
{ 

environment 

{
	registry = "amathew8/coursework2"
	registryCredential = 'dockerhub'
	dockerImage = ''
}


agent any
	
	stages
	{
		stage('Build')
		{
			steps
			{
				script 
				{

					echo 'Building File'
					dockerImage = docker.build registry + ":$BUILD_NUMBER"
					echo 'Build Successful'
				}
			}
		}
		
		stage('SonarQubeTest')
		{
			environment
			{
				scannerHome = tool 'SonarQube'
			}
			steps
			{
				echo 'SonarQube Testing'
				withSonarQubeEnv('SonarQube')
				{
					sh "${scannerHome}/bin/sonar-scanner"
				}

				timeout(time: 10, unit: 'MINUTES')
				{
					waitForQualityGate abortPipeline: true
				}
				echo 'SonarQube Test Successful'
			}
		}
		
		stage('PushingToDocker')
		{
			steps
			{
				script
				{
					echo 'Pushing Image to DockerHub'
					docker.withRegistry('https://registry.hub.docker.com' , 'dockerhub' )
					{
						dockerImage.push()
					}
					echo 'Image Pushed Successfully'
				}
			}
		}	
	
	}	
}
