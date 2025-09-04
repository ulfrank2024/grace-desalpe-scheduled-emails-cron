FROM node:20-alpine
        WORKDIR /app
        COPY package*.json ./
        RUN npm install --production
        COPY scripts/sendScheduledEmails.js ./scripts/sendScheduledEmails.js
        COPY db/supabase.js ./db/supabase.js
        COPY services/emailService.js ./services/emailService.js
        RUN chmod +x ./scripts/sendScheduledEmails.js
        CMD ["node", "./scripts/sendScheduledEmails.js"]