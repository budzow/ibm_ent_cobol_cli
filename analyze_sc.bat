rem sonar-scanner -Dsonar.sources=. -Dsonar.projectKey=ibm_ent_cobol_cli -Dsonar.organization=budzow-github -Dsonar.login=e5990ff3d41ff9d6be8cd6345fee7cef1485f3c0 -Dsonar.host.url=http://sonarcloud.io -Dsonar.projectVersion=1

set /p token=SonarCloud token?
sonar-scanner -Dsonar.sources=. -Dsonar.projectKey=ibm_ent_cobol_cli -Dsonar.organization=budzow-github -Dsonar.login=%token% -Dsonar.host.url=http://sonarcloud.io -Dsonar.projectVersion=1
