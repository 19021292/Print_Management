<template>
  <div class="design-management">
  <a-breadcrumb style="margin: 16px 0">
      <a-breadcrumb-item>Trang chủ</a-breadcrumb-item>
      <a-breadcrumb-item>Quản lý thiết kế</a-breadcrumb-item>
    </a-breadcrumb>
      <div class="actions-bar">
        <a-button type="primary" @click="showCreateModal">Thêm thiết kế</a-button>
      </div>
    <a-modal
      v-model:visible="isModalVisible"
      title="Thêm Thiết kế"
      @ok="handleOk"
      @cancel="handleCancel"
    >
      <a-form :model="newDesign" :rules="rules" ref="designForm" layout="vertical">
        <a-form-item label="Dự án" name="projectId" style="margin-bottom: 10px;">
          <a-select v-model:value="newDesign.projectId" placeholder="Chọn một dự án" required>
            <a-select-option v-for="project in projects" :key="project.id" :value="project.id">
              {{ project.projectName }}
            </a-select-option>
          </a-select>
        </a-form-item>
        <a-form-item label="ID Nhà thiết kế" name="designerId" style="margin-bottom: 10px;">
          <a-input v-model:value="newDesign.designerId" placeholder="Nhập ID nhà thiết kế" required />
        </a-form-item>
        <a-form-item label="Tệp Thiết kế" name="filePath" style="margin-bottom: 10px;">
          <a-upload
            :before-upload="handleFileUpload"
            :show-upload-list="false"
          >
            <a-button icon="upload">Nhấn để Tải lên</a-button>
          </a-upload>
        </a-form-item>
      </a-form>
    </a-modal>

    <a-table :dataSource="designs" :columns="columns" rowKey="id" class="design-table">
      <template #bodyCell="{ column, record }">
        <span v-if="column.key === 'action'">
          <a-button
            type="primary"
            @click="approveDesign(record.id)"
            :disabled="record.designStatus === 'Approved'"
          >
            Chấp nhận
          </a-button>
        </span>
        <span v-else>{{ record[column.dataIndex] || '-' }}</span>
      </template>
    </a-table>
  </div>
</template>

<script>
import { getAllDesigns, addDesign, approveDesign } from '@/apis/projectApi';
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
          title: 'Thời gian Thiết kế',
          dataIndex: 'designTime',
          key: 'designTime',
        },
        {
          title: 'Trạng thái',
          dataIndex: 'designStatus',
          key: 'designStatus',
        },
        {
          title: 'ID Người phê duyệt',
          dataIndex: 'approverId',
          key: 'approverId',
        },
        {
          title: 'ID',
          dataIndex: 'id',
          key: 'id',
        },
        {
          title: 'Hành động',
          key: 'action',
          scopedSlots: { customRender: 'action' },
        },
      ],
      isModalVisible: false,
      rules: {
        projectId: [{ required: true, message: 'Vui lòng chọn dự án!' }],
        designerId: [{ required: true, message: 'Vui lòng nhập ID nhà thiết kế!' }],
      },
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
       console.log('Submitting design:', this.newDesign);
       await addDesign(this.newDesign);
       this.fetchDesigns();
     } catch (error) {
       console.error('Lỗi khi thêm thiết kế:', error);
     }
   },
    async approveDesign(designId) {
      try {
        await approveDesign(designId);
        this.fetchDesigns(); 
      } catch (error) {
        console.error('Lỗi khi chấp nhận thiết kế:', error);
      }
    },
    showCreateModal() {
      this.isModalVisible = true;
      this.newDesign = {
        projectId: null,
        designerId: '',
        filePath: '',
      };
    },
    async handleOk() {
      this.$refs.designForm.validate().then(async () => {
        try {
          console.log('Submitting design:', this.newDesign);
          await addDesign(this.newDesign);
          this.fetchDesigns();
          this.isModalVisible = false;
        } catch (error) {
          console.error('Lỗi khi thêm thiết kế:', error);
        }
      }).catch(() => {
        console.error('Vui lòng điền đầy đủ thông tin!');
      });
    },
    handleCancel() {
      this.isModalVisible = false;
    },
  },
  mounted() {
    this.fetchDesigns();
    this.fetchProjects();
  },
};
</script>

<style scoped>
.design-table {
  margin-top: 10px;
}

.actions-bar {
  display: flex;
  justify-content: space-between;
  margin-bottom: 16px;
}
</style> 