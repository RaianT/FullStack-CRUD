import { Router } from 'express'
import { getProducts, createProducts,deleteProduto  } from '../controllers/productsController.js'

const route = Router()

route.get('/products', getProducts)
route.patch('/products')
route.delete('/products/:id', deleteProduto)
route.put('/products')
route.post('/products', createProducts)

export default route