# Use lightweight, supported Node.js LTS
FROM node:18-slim

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install production dependencies only
RUN npm install --only=production

# Copy application source
COPY . .

# Cloud Run listens on port 8080
ENV PORT=8080

# Start the app
CMD ["npm", "start"]
