<template>
  <div>
    <a-breadcrumb style="margin: 16px 0">
      <a-breadcrumb-item>Trang chủ</a-breadcrumb-item>
      <a-breadcrumb-item>Quản lý dự án</a-breadcrumb-item>
    </a-breadcrumb>
    <div class="actions-bar">
      <a-button type="primary" @click="showCreateModal">Thêm dự án</a-button>
    </div>
    <a-table
      :columns="columns"
      :dataSource="projects"
      :pagination="{ pageSize: 10 }"
      rowKey="id"
    >
     
    </a-table>
    <a-modal
      v-model:visible="isModalVisible"
      title="Dự án"
      @ok="handleOk"
      @cancel="handleCancel"
    >
      <a-form :model="formData" :rules="rules" ref="projectForm" layout="vertical">
        <a-form-item label="Tên dự án" name="projectName" style="margin-bottom: 10px;">
          <a-input v-model:value="formData.projectName" />
        </a-form-item>
        <a-form-item label="Mô tả" name="requestDescriptionFromCustomer" style="margin-bottom: 10px;">
          <a-input v-model:value="formData.requestDescriptionFromCustomer" />
        </a-form-item>
        <a-form-item label="Ngày bắt đầu" name="startDate" style="margin-bottom: 10px;">
          <a-date-picker v-model:value="formData.startDate" style="width: 100%;" />
        </a-form-item>
        <a-form-item label="Ngày kết thúc dự kiến" name="expectedEndDate" style="margin-bottom: 10px;">
          <a-date-picker v-model:value="formData.expectedEndDate" style="width: 100%;" />
        </a-form-item>
        <a-form-item label="ID nhân viên" name="employeeId" style="margin-bottom: 10px;">
          <a-input-number v-model:value="formData.employeeId" style="width: 100%;" />
        </a-form-item>
        <a-form-item label="ID khách hàng" name="customerId" style="margin-bottom: 10px;">
          <a-input-number v-model:value="formData.customerId" style="width: 100%;" />
        </a-form-item>
        <a-form-item label="Trạng thái dự án" name="projectStatus" style="margin-bottom: 10px;">
          <a-input-number v-model:value="formData.projectStatus" style="width: 100%;" />
        </a-form-item>
      </a-form>
    </a-modal>
  </div>
</template>

<script>
import { getAllProjects, createProject } from '@/apis/projectApi';
import { message } from 'ant-design-vue';
import dayjs from 'dayjs';

export default {
  name: 'ProjectManagement',
  data() {
    return {
      projects: [],
      columns: [
        {
          title: 'Tên dự án',
          dataIndex: 'projectName',
          key: 'projectName',
        },
        {
          title: 'Mô tả',
          dataIndex: 'requestDescriptionFromCustomer',
          key: 'requestDescriptionFromCustomer',
        },
        {
          title: 'Ngày bắt đầu',
          dataIndex: 'startDate',
          key: 'startDate',
        },
        {
          title: 'Ngày kết thúc dự kiến',
          dataIndex: 'expectedEndDate',
          key: 'expectedEndDate',
        },
        {
          title: 'ID nhân viên',
          dataIndex: 'employeeId',
          key: 'employeeId',
        },
        {
          title: 'ID khách hàng',
          dataIndex: 'customerId',
          key: 'customerId',
        },
        {
          title: 'Trạng thái dự án',
          dataIndex: 'projectStatus',
          key: 'projectStatus',
        },
      ],
      isModalVisible: false,
      formData: {
        id: null,
        projectName: '',
        requestDescriptionFromCustomer: '',
        startDate: '',
        expectedEndDate: '',
        employeeId: 0,
        customerId: 0,
        projectStatus: 0,
      },
      isEditing: false,
      rules: {
        projectName: [{ required: true, message: 'Vui lòng nhập tên dự án!' }],
        requestDescriptionFromCustomer: [{ required: true, message: 'Vui lòng nhập mô tả!' }],
        startDate: [{ required: true, message: 'Vui lòng nhập ngày bắt đầu!' }],
        expectedEndDate: [{ required: true, message: 'Vui lòng nhập ngày kết thúc dự kiến!' }],
        employeeId: [{ required: true, message: 'Vui lòng nhập ID nhân viên!' }],
        customerId: [{ required: true, message: 'Vui lòng nhập ID khách hàng!' }],
        projectStatus: [{ required: true, message: 'Vui lòng nhập trạng thái dự án!' }],
      },
    };
  },
  async created() {
    this.fetchProjects();
  },
  methods: {
    async fetchProjects() {
      try {
        const data = await getAllProjects();
        this.projects = data;
      } catch (error) {
        message.error(error.message || 'Có lỗi xảy ra khi tải dự án!');
      }
    },
    async handleSearch() {
      // Implement search logic if needed
    },
    showCreateModal() {
      this.isEditing = false;
      this.formData = {
        id: null,
        projectName: '',
        requestDescriptionFromCustomer: '',
        startDate: '',
        expectedEndDate: '',
        employeeId: 0,
        customerId: 0,
        projectStatus: 0,
      };
      this.isModalVisible = true;
    },
    showEditModal(record) {
      this.isEditing = true;
      this.formData = {
        ...record,
        startDate: dayjs(record.startDate),
        expectedEndDate: dayjs(record.expectedEndDate),
      };
      this.isModalVisible = true;
    },
    async handleOk() {
      this.$refs.projectForm.validate().then(async () => {
        try {
          const payload = {
            projectName: this.formData.projectName,
            requestDescriptionFromCustomer: this.formData.requestDescriptionFromCustomer,
            startDate: this.formData.startDate,
            expectedEndDate: this.formData.expectedEndDate,
            employeeId: this.formData.employeeId,
            customerId: this.formData.customerId,
            projectStatus: this.formData.projectStatus,
          };

          if (this.isEditing) {
            // Implement update logic if needed
          } else {
            await createProject(payload);
            message.success('Thêm dự án thành công!');
          }
          this.isModalVisible = false;
          this.fetchProjects();
        } catch (error) {
          message.error(error.message || 'Có lỗi xảy ra!');
        }
      }).catch(() => {
        message.error('Vui lòng điền đầy đủ thông tin!');
      });
    },
    handleCancel() {
      this.isModalVisible = false;
    },
    async handleDelete() {
      // Implement delete logic if needed
    },
  },
};
</script>

<style scoped>
.actions-bar {
  display: flex;
  justify-content: space-between;
  margin-bottom: 16px;
}
</style> 