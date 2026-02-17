import Router from "express";
import { getAvailableProduct, getProductInfo, getProducts, initialPage } from "../controllers/controller";


const router = Router();

router.get("/", initialPage)
router.get("/products", getProducts);
router.get("/product/:idp", getProductInfo);


export default router;
