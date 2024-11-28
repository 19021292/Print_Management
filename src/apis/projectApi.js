import axiosInstance from './axiosConfig';

export const createProject = async (projectData) => {
  try {
    const response = await axiosInstance.post('/Project/CreateProject', projectData);
    return response.data;
  } catch (error) {
    console.error('Error creating project:', error);
    throw error;
  }
};

export const addDesign = async (designData) => {
  try {
    const response = await axiosInstance.post('/Project/AddDesign', designData);
    return response.data;
  } catch (error) {
    console.error('Error adding design:', error);
    throw error;
  }
};

export const approveDesign = async (designId) => {
  try {
    const response = await axiosInstance.post(`/Project/ApproveDesign/${designId}`);
    return response.data;
  } catch (error) {
    console.error('Error approving design:', error);
    throw error;
  }
};

export const rejectDesign = async (designId) => {
  try {
    const response = await axiosInstance.post(`/Project/RejectDesign/${designId}`);
    return response.data;
  } catch (error) {
    console.error('Error rejecting design:', error);
    throw error;
  }
};

export const confirmDesignForPrinting = async (body) => {
  try {
    const response = await axiosInstance.post('/Project/ConfirmDesign-for-printing', { designId: body });
    return response.data;
  } catch (error) {
    console.error('Error confirming design for printing:', error);
    throw error;
  }
};

export const createResources = async (resourceData) => {
  try {
    const response = await axiosInstance.post('/Project/CreateResources', resourceData);
    return response.data;
  } catch (error) {
    console.error('Error creating resources:', error);
    throw error;
  }
};

export const createResourceProperty = async (propertyData) => {
  try {
    const response = await axiosInstance.post('/Project/CreateResource-property', propertyData);
    return response.data;
  } catch (error) {
    console.error('Error creating resource property:', error);
    throw error;
  }
};

// New API for creating resource property detail
export const createResourcePropertyDetail = async (detailData) => {
  try {
    const response = await axiosInstance.post('/Project/CreateResource-property-detail', detailData);
    return response.data;
  } catch (error) {
    console.error('Error creating resource property detail:', error);
    throw error;
  }
};


export const createResourceForPrintJob = async (resourceData) => {
  try {
    const response = await axiosInstance.post('/Project/CreateResource-for-print-job', resourceData);
    return response.data;
  } catch (error) {
    console.error('Error creating resource for print job:', error);
    throw error;
  }
};

export const usingResourceForPrintJob = async (resourceData) => {
  try {
    const response = await axiosInstance.post('/Project/UsingResource-for-print-job', resourceData);
    return response.data;
  } catch (error) {
    console.error('Error using resource for print job:', error);
    throw error;
  }
};

export const confirmFinishingProject = async () => {
  try {
    const response = await axiosInstance.post('/Project/ConfirmFinishing-project');
    return response.data;
  } catch (error) {
    console.error('Error confirming finishing project:', error);
    throw error;
  }
};

export const getAllResources = async () => {
  try {
    const response = await axiosInstance.get('/Project/get-all-resources');
    return response.data;
  } catch (error) {
    console.error('Error getting all resources:', error);
    throw error;
  }
};

export const getAllResourceProperties = async () => {
  try {
    const response = await axiosInstance.get('/Project/GetAllResourceProperties');
    return response.data;
  } catch (error) {
    console.error('Error getting all resource properties:', error);
    throw error;
  }
};

export const getAllProjects = async () => {
  try {
    const response = await axiosInstance.get('/Project/all-projects');
    return response.data;
  } catch (error) {
    console.error('Error getting all projects:', error);
    throw error;
  }
};

export const getAllDesigns = async () => {
  try {
    const response = await axiosInstance.get('/Project/all-designs');
    return response.data;
  } catch (error) {
    console.error('Error getting all designs:', error);
    throw error;
  }
};

export const getAllPrintJobs = async () => {
  try {
    const response = await axiosInstance.get('/Project/print-jobs');
    return response.data;
  } catch (error) {
    console.error('Error getting all print jobs:', error);
    throw error;
  }
};
// Thêm các hàm khác tương tự cho các endpoint còn lại
// ... 
