import { Router } from 'express'
import { getMaterials, createMaterials, deleteMaterial, editMaterial } from '../controllers/materialsController.js'

const route = Router()

route.put('/materials/:id', editMaterial)
route.get('/materials', getMaterials)
route.patch('/materials')
route.delete('/materials/:id', deleteMaterial)
route.post('/materials', createMaterials)

export default route