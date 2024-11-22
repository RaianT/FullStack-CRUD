import { Router } from 'express'
import { getMaterials, createMaterials, getNameMaterials, deleteMaterial } from '../controllers/materialsController.js'

const route = Router()

route.get('/name-materials', getNameMaterials)
route.get('/materials', getMaterials)
route.patch('/materials')
route.delete('/materials/:id', deleteMaterial)
route.put('/materials')
route.post('/materials', createMaterials)

export default route