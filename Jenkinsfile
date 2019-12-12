pipeline
{ 

environment 

{
	registry = "amathew8/coursework_2"
	registryCredential = 'dockerhub'
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
					docker.build registry + ":$BUILD_NUMBER"
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
					docker.withRegistry('https://hub.docker.com/repository/docker/amathew8/coursework_2', 'amathew8')
					{
						app.push("${env.BUILD_NUMBER}")
						app.push("latest")
					}
					echo 'Image Pushed Successfully'
				}
			}
		}	
	
	}	
}
