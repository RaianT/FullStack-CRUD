import express from 'express'
import routes from './src/routes/productRoutes' 

const app = express()

app.use(routes)

app.listen(80)
