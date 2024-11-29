import { Router } from 'express'
import { getProducts, createProducts,deleteProduto, editProduto  } from '../controllers/productsController.js'

const route = Router()

route.put('/products/:id', editProduto)
route.get('/products', getProducts)
route.patch('/products')
route.delete('/products/:id', deleteProduto)
route.post('/products', createProducts)

export default route