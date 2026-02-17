import Router from "express";
import { managePurchaseData, getProductInfo, getProducts, initialPage } from "../controllers/controller";


const router = Router();

router.get("/", initialPage);
router.get("/products", getProducts);
router.get("/product/:idp", getProductInfo);
router.get("/purchased-product", managePurchaseData);

export default router;
