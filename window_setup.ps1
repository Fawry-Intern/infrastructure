@echo off
echo Creating Fawry-Intern directory...
mkdir Fawry-Intern
cd Fawry-Intern

echo Cloning repositories...

REM List of repositories to clone
set repos=infrastructure eureka-server api-gateway store-api bank-api notification-api product-api order-api shipping-api user-api coupon-api e-commerce-frontend bank-ui

REM Clone each repository
for %%r in (%repos%) do (
    echo Cloning %%r...
    git clone https://github.com/Fawry-Intern/%%r %%r
    if errorlevel 0 (
        echo Successfully cloned %%r
    ) else (
        echo Failed to clone %%r
    )
    echo ------------------------
)

echo All repositories have been cloned into the Fawry-Intern directory

REM Navigate to infrastructure directory and start Docker Compose
echo Starting Docker Compose services...
cd infrastructure
docker-compose up -d
echo Services started successfully!
pause
