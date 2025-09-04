 # Use a Node.js base image
     FROM node:20-alpine
     
     # Set the working directory
     WORKDIR /app
     
     # Copy package.json and package-lock.json to install dependencies
     COPY package*.json ./
     
    # Install dependencies
    RUN npm install --production
    
    # Copier le run.sh script dans le répertoire de travail
    COPY run.sh .
    
    # Copy the Node.js script and its dependencies
    COPY scripts/sendScheduledEmails.js ./scripts/sendScheduledEmails.js
    COPY db/supabase.js ./db/supabase.js
    COPY services/emailService.js ./services/emailService.js
    
    # Ensure the script is executable
    RUN chmod +x ./scripts/sendScheduledEmails.js
    
    # Define the command to run the script
    CMD ["node", "./scripts/sendScheduledEmails.js"]
