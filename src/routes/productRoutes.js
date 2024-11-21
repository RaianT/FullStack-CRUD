import { Router } from 'express'
import { getProducts } from '../controllers/productsController.js'

const route = Router()

route.get('/products', getProducts)
route.patch('/products')
route.delete('/products')
route.put('/products')
route.post('/products')

export default route