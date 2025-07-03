# dotnetcore-webapp-azure-iis

This project is a .NET Core web application designed to be deployed to an IIS server on an Azure Virtual Machine using Azure DevOps pipelines. 

## Project Structure

- **src/DotNetCoreWebApp**: Contains the main application code.
  - `DotNetCoreWebApp.csproj`: Project file defining dependencies and build settings.
  - `Program.cs`: Entry point of the application.
  - `Startup.cs`: Configures services and the request pipeline.
  - **Controllers**: Contains controller classes.
    - `HomeController.cs`: Handles requests for the home page.
  - **Views**: Contains Razor view files.
    - **Home**: Contains views related to the home page.
      - `Index.cshtml`: HTML markup for the home page.
  - **wwwroot**: Directory for static files (CSS, JavaScript, images).

- **tests/DotNetCoreWebApp.Tests**: Contains unit tests for the application.
  - `DotNetCoreWebApp.Tests.csproj`: Project file for the test project.
  - `HomeControllerTests.cs`: Unit tests for the `HomeController`.

- **pipelines**: Contains YAML files for CI/CD pipelines and PowerShell scripts for deployment.
  - `azure-pipelines-ci.yml`: CI pipeline configuration.
  - `azure-pipelines-cd.yml`: CD pipeline configuration.
  - **scripts**: Contains PowerShell scripts for setup and deployment.
    - `install-iis.ps1`: Installs IIS on the Azure VM.
    - `install-webdeploy.ps1`: Installs Web Deploy on the Azure VM.
    - `deploy-to-iis.ps1`: Deploys the application to IIS.

- **.gitignore**: Specifies files and directories to be ignored by Git.

## Configuration Steps Outside of VS Code

1. **Azure DevOps Setup**: 
   - Create a new Azure DevOps project.
   - Connect it to your GitHub repository.

2. **Pipeline Configuration**: 
   - In Azure DevOps, create two pipelines using the YAML files provided:
     - `azure-pipelines-ci.yml` for Continuous Integration.
     - `azure-pipelines-cd.yml` for Continuous Deployment.

3. **Azure VM Configuration**: 
   - Ensure the Azure VM has the necessary permissions and network access for Azure DevOps to deploy to it.

4. **PowerShell Execution Policy**: 
   - Set the execution policy on the Azure VM to allow the execution of PowerShell scripts.

5. **IIS and Web Deploy Configuration**: 
   - Run the `install-iis.ps1` and `install-webdeploy.ps1` scripts on the Azure VM to set up IIS and Web Deploy.

6. **Service Connection**: 
   - Create a service connection in Azure DevOps to allow the pipelines to access the Azure VM.

## Usage

After setting up the project and configuring the pipelines, you can push changes to your GitHub repository. The CI pipeline will automatically trigger to build and test the application, while the CD pipeline will deploy the application to the Azure VM when changes are made to the main branch.

Make sure to replace any placeholder values in the YAML files and PowerShell scripts with actual values relevant to your Azure environment.