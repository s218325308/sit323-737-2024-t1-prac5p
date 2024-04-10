# Use the official Node.js image as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Healthcheck
HEALTHCHECK --interval=1m --timeout=10s --start-period=20s --retries=3 CMD curl --fail http://localhost:3040 || exit 1

# Expose the port the app runs on
EXPOSE 3040

# Command to run the application
CMD ["node", "advCalculatorWLogger.js"]
