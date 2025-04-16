# Create parent directory
mkdir -p Fawry-Intern
cd Fawry-Intern

# List of repositories to clone
repos=(
    "infrastructure"
    "eureka-server"
    "api-gateway"
    "store-api"
    "bank-api"
    "notification-api"
    "product-api"
    "order-api"
    "shipping-api"
    "user-api"
    "coupon-api"
    "e-commerce-frontend"
    "bank-ui"
)

# Clone each repository
for repo in "${repos[@]}"; do
    echo "Cloning $repo..."
    git clone "https://github.com/Fawry-Intern/$repo" "$repo"
    if [ $? -eq 0 ]; then
        echo "Successfully cloned $repo"
    else
        echo "Failed to clone $repo"
    fi
    echo "------------------------"
done

echo "All repositories have been cloned into the Fawry-Intern directory"

# Navigate to infrastructure directory and start Docker Compose
echo "Starting Docker Compose services..."
cd infrastructure
docker-compose up -d
echo "Services started successfully!"
