<template>
  <div class="design-management">
    <a-page-header title="Quản lý Thiết kế" />
    <a-card>
      <a-form @submit.prevent="submitDesign" layout="vertical">
        <a-form-item label="Dự án">
          <a-select v-model="newDesign.projectId" placeholder="Chọn một dự án" required>
            <a-select-option v-for="project in projects" :key="project.id" :value="project.id">
              {{ project.projectName }}
            </a-select-option>
          </a-select>
        </a-form-item>
        <a-form-item label="ID Nhà thiết kế">
          <a-input v-model="newDesign.designerId" placeholder="Nhập ID nhà thiết kế" required />
        </a-form-item>
        <a-form-item label="Tệp Thiết kế">
          <a-upload
            :before-upload="handleFileUpload"
            :show-upload-list="false"
          >
            <a-button icon="upload">Nhấn để Tải lên</a-button>
          </a-upload>
        </a-form-item>
        <a-form-item>
          <a-button type="primary" html-type="submit">Thêm Thiết kế</a-button>
        </a-form-item>
      </a-form>
    </a-card>

    <a-table :dataSource="designs" :columns="columns" rowKey="id" class="design-table" />
  </div>
</template>

<script>
import { getAllDesigns, addDesign } from '@/apis/projectApi';
import { getAllProjects } from '@/apis/projectApi';
import { ref, uploadBytes, getDownloadURL } from 'firebase/storage'; 
import { storage } from '@/firebaseConfig';

export default {
  name: 'DesignManagement',
  data() {
    return {
      designs: [],
      projects: [],
      newDesign: {
        projectId: null,
        designerId: '',
        filePath: '',
      },
      columns: [
        {
          title: 'ID Dự án',
          dataIndex: 'projectId',
          key: 'projectId',
        },
        {
          title: 'ID Nhà thiết kế',
          dataIndex: 'designerId',
          key: 'designerId',
        },
        {
          title: 'Đường dẫn Tệp',
          dataIndex: 'filePath',
          key: 'filePath',
        },
        {
          title: 'Trạng thái',
          dataIndex: 'designStatus',
          key: 'designStatus',
        },
      ],
    };
  },
  methods: {
    async fetchDesigns() {
      try {
        this.designs = await getAllDesigns();
      } catch (error) {
        console.error('Lỗi khi lấy danh sách thiết kế:', error);
      }
    },
    async fetchProjects() {
      try {
        this.projects = await getAllProjects();
      } catch (error) {
        console.error('Lỗi khi lấy danh sách dự án:', error);
      }
    },
    async handleFileUpload(file) {
      try {
        const storageRef = ref(storage, `designs/${file.name}`);
        const snapshot = await uploadBytes(storageRef, file);
        const filePath = await getDownloadURL(snapshot.ref);
        this.newDesign.filePath = filePath;
        return false; // Ngăn chặn hành vi tải lên mặc định
      } catch (error) {
        console.error('Lỗi khi tải lên tệp:', error);
        return false;
      }
    },
    async submitDesign() {
      try {
        await addDesign(this.newDesign);
        this.fetchDesigns(); // Làm mới danh sách thiết kế
      } catch (error) {
        console.error('Lỗi khi thêm thiết kế:', error);
      }
    },
  },
  mounted() {
    this.fetchDesigns();
    this.fetchProjects();
  },
};
</script>

<style scoped>
.design-management {
  padding: 20px;
}

.design-table {
  margin-top: 20px;
}
</style> 