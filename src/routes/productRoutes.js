import { Router } from 'express'

const route = Router()

route.get('/products')
route.patch('/products')
route.delete('/products')
route.put('/products')
route.post('/products')

export default route