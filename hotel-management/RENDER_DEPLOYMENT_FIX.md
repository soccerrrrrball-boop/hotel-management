# Render Deployment Fix

## Issue
Render is trying to use Docker and looking for a Dockerfile in the root directory, but we want to use Maven instead.

## Solution

### Option 1: Use render.yaml (Recommended)

1. **Ensure `render.yaml` is in your repository root**
   - If your GitHub repo root is `hotel-management/`, the `render.yaml` should be there
   - If your GitHub repo root is the parent directory, move `render.yaml` to the root

2. **In Render Dashboard:**
   - Go to your service settings
   - Make sure **Environment** is set to **Java** (NOT Docker)
   - The `render.yaml` will automatically configure the build

3. **If Render still tries to use Docker:**
   - In Render Dashboard → Your Service → Settings
   - Under "Build & Deploy", ensure:
     - **Environment**: Java
     - **Docker** is NOT selected
     - **Root Directory**: `hotel-management/backend` (or `backend` if `hotel-management` is your repo root)

### Option 2: Manual Configuration

If `render.yaml` doesn't work, configure manually in Render Dashboard:

1. **Service Settings:**
   - **Name**: `hotel-management-backend`
   - **Environment**: `Java` (NOT Docker)
   - **Root Directory**: `hotel-management/backend`
   - **Build Command**: `mvn clean package -DskipTests`
   - **Start Command**: `java -jar target/*.jar`

2. **Environment Variables:**
   ```
   SPRING_DATASOURCE_URL=jdbc:mysql://your-db-host:3306/hotel_booking
   SPRING_DATASOURCE_USERNAME=your-username
   SPRING_DATASOURCE_PASSWORD=your-password
   SERVER_PORT=5050
   CORS_ALLOWED_ORIGINS=https://your-netlify-site.netlify.app
   AWS_S3_ACCESS_KEY=dummy
   AWS_S3_SECRET_KEY=dummy
   ```

### Important Notes

- **DO NOT** select Docker as the environment
- The Dockerfile is for local Docker deployment only
- Render should use Maven to build the JAR file
- Make sure the `render.yaml` file is committed and pushed to GitHub

## Verify

After deployment, check the build logs in Render. You should see:
- Maven downloading dependencies
- `mvn clean package` running
- JAR file being created
- Java starting the application

If you see Docker-related commands, Render is using the wrong environment.

