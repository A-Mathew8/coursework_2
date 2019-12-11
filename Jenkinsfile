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
				withSonarQubeEnv('SonarQube')
				{
					sh "${scannerHome}/bin/sonar-scanner"
				}

				timeout(time: 10, unit: 'MINUTES')
				{
					waitForQualityGate abortPipeline: true
				}
			}
		}	
	
	}	
}
