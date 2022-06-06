import express from 'express'
import dotenv from 'dotenv'
import Router from './routes/routes.js'
import { dbConfig } from './config/databaseConfig.js'
import cors from 'cors'
dotenv.config()
const app = express()
app.use(express.json())
app.use(cors())
dbConfig()

app.use('/api/v1', Router)

app.listen(process.env.PORT, () =>
  console.log(`Server is listening at http://localhost://${process.env.PORT}`),
)
