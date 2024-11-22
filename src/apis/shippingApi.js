import axiosInstance from './axiosConfig';

export const createDelivery = async (deliveryData) => {
  try {
    const response = await axiosInstance.post('/api/Shipping/Create delivery', deliveryData);
    return response.data;
  } catch (error) {
    console.error('Error creating delivery:', error);
    throw error;
  }
};

export const updateDeliveryStatus = async (statusData) => {
  try {
    const response = await axiosInstance.post('/api/Shipping/Update delivery-status', statusData);
    return response.data;
  } catch (error) {
    console.error('Error updating delivery status:', error);
    throw error;
  }
};

// Thêm các hàm khác tương tự cho các endpoint còn lại
// ... 