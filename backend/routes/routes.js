import express from 'express'
import { getUser } from '../middlewares/getuser.js'
import {
  getAllUsers,
  getSingleUser,
  signUp,
  login,
  updateProfile,
  deleteProfile,
} from '../controllers/authentication.js'

import { authMiddleWare } from '../middlewares/authmiddleware.js'
import dotenv from 'dotenv'
import {
  addToMyFavorites,
  createQuote,
  deleteQuote,
  getAllQuotes,
  getQuote,
  removeFromMyFavorites,
  updateQuote,
} from '../controllers/quote.js'
dotenv.config()
const router = express.Router()

router.get('/getallusers', [authMiddleWare], getAllUsers)
router.get('/getuser/:id', [authMiddleWare, getUser], getSingleUser)
router.post('/signup', signUp)
router.post('/login', login)
router.put('/updateprofile/:id', [getUser, authMiddleWare], updateProfile)
router.delete('/deleteprofile/:id', [authMiddleWare, getUser], deleteProfile)

/////////////////////////
//for only authenticated users
router.get('/quote', [authMiddleWare], getAllQuotes)
router.get('/quote/:id', [authMiddleWare], getQuote)
router.post('/quote', [authMiddleWare], createQuote)
router.post('/quote/favorite/:id', [authMiddleWare], addToMyFavorites),
  router.put('quote')
router.put('/quote/:id', [authMiddleWare], updateQuote)
router.delete('/quote/:id', [authMiddleWare], deleteQuote)
router.delete('/quote/favorite/:id', [authMiddleWare], removeFromMyFavorites)
export default router
