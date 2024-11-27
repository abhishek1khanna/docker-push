FROM node:20
# Set the working directory
WORKDIR /app
# Install git and clone the repository
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/abhishek1khanna/git-app.git .
# Copy only the package.json and package-lock.json first (for better caching)
#COPY package*.json ./
# Install dependencies
RUN npm install
# Copy the rest of the code (this invalidates the cache if other files change)
#COPY . .
# Set environment variable
ENV PORT 3001
# Expose the application port
EXPOSE $PORT
# Start the application
CMD ["npm", "run", "dev"]
