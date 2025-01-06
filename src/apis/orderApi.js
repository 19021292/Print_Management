import axiosInstance from "./axiosConfig"

export const addOrder = async (orderData) => {
  try {
    const response = await axiosInstance.post("/Project/createOrder", orderData)
    return response.data
  } catch (error) {
    console.error("Error adding order:", error)
    throw error
  }
}

export const getAllOrders = async () => {
  try {
    const response = await axiosInstance.get("/Project/getAllOrder")
    return response.data.data
  } catch (error) {
    console.error("Error getting all orders:", error)
    throw error
  }
}
