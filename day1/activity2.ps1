# Presentar las opciones

Write-Output "Select the service to admin:"
Write-Output "1. Node.js"
Write-Output "2. Java Server"
Write-Output "3. MySQL"
Write-Output "4. Apache Server"

# Pedir la opción seleccionada

$option = Read-Host "Enter your choice (1-4)"


if ($option-eq "1") {
    Write-Output "Node.js selected"
    Write-Output "What do you want to do?"
    Write-Output "1. Install Node.js"
    Write-Output "2. Update Node.js"
    Write-Output "3. Run a local node project"

    $subOption = Read-Host "Enter your choice (1-3)"

    if ($subOption -eq "1") {
        winget install nodejs
        Clear-Host
        Write-Output "Node.js installed"
    }

    if ($subOption -eq "2") {
        nvm install node --reinstall-packages-from=current
        Clear-Host
        Write-Output "Node.js updated"
    }

    if ($subOption -eq "3") {
        Write-Host "Enter the directory path for your local node project:"
        $dirPath = Read-Host
        Set-Location $dirPath
        npm install
        Clear-Host
        Write-Output "dependencies installed"
        Write-Output "Starting nodejs service"
        npm start
    }
}

if ($option -eq "2") {
    Write-Output "Java Server selected"
    Write-Output "What do you want to do?"
    Write-Output "1. Install Java"
    Write-Output "2. Update Java"

    $subOption = Read-Host "Enter your choice (1-2)"

    if ($subOption -eq "1") {
        choco install java
        Clear-Host
        Write-Output "Java installed"
    }

    if ($subOption -eq "2") {
        choco upgrade java
        Clear-Host
        Write-Output "Java updated"
    }
}

if ($option -eq "3") {
    Write-Output "MySQL selected"
    Write-Output "What do you want to do?"
    Write-Output "1. Install MySQL"
    Write-Output "2. Update MySQL"
    Write-Output "3. Connect to MySQL Server"

    $subOption = Read-Host "Enter your choice (1-3)"

    if ($subOption -eq "1") {
        choco install mysql
        Clear-Host
        Write-Output "MySQL installed"
    }

    if ($subOption -eq "2") {
        choco upgrade mysql
        Clear-Host
        Write-Output "MySQL updated"
    }

    if ($subOption -eq "3") {
        Write-Host "Enter the MySQL server IP address:"
        $ipAddress = Read-Host
        Write-Host "Enter the MySQL server port number:"
        $port = Read-Host
        Write-Host "Enter the MySQL server username:"
        $username = Read-Host
        Write-Host "Enter the MySQL server password:"
        $password = Read-Host
        Write-Host "Enter the database name:"
        $databaseName = Read-Host

        # Connect to MySQL server and create the database
        $connection = New-Object System.Data.SqlClient.SqlConnection("Data Source=$ipAddress,$port;Initial Catalog=$databaseName;User ID=$username;Password=$password")
        $connection.Open()
        Clear-Host
        Write-Output "MySQL connection established"
        $connection.Close()
    }

}

if ($option -eq "4") {
    Write-Output "Apache Server selected"
    Write-Output "For this case we cant do anything..."
}
