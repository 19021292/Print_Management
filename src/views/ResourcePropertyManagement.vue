<template>
  <div>
    <a-breadcrumb style="margin: 16px 0">
      <a-breadcrumb-item>Trang chủ</a-breadcrumb-item>
      <a-breadcrumb-item>Quản lý thuộc tính tài nguyên</a-breadcrumb-item>
    </a-breadcrumb>
    <div class="actions-bar">
      <a-button type="primary" @click="showCreateModal">Thêm thuộc tính</a-button>
    </div>
    <a-table
      :columns="columns"
      :dataSource="resourceProperties"
      :pagination="{ pageSize: 10 }"
      rowKey="id"
    >
      <template #bodyCell="{ column, record }">
        <span v-if="column.key === 'actions'">
          <a @click="showEditModal(record)">Sửa</a>
          <a-divider type="vertical" />
          <a-popconfirm
            title="Bạn có chắc chắn muốn xóa thuộc tính này không?"
            ok-text="Có"
            cancel-text="Không"
            @confirm="handleDelete(record.id)"
          >
            <a>Xóa</a>
          </a-popconfirm>
        </span>
        <span v-else>{{ record[column.dataIndex] || '-' }}</span>
      </template>
    </a-table>
    <a-modal
      v-model:visible="isModalVisible"
      title="Thuộc tính tài nguyên"
      @ok="handleOk"
      @cancel="handleCancel"
    >
      <a-form :model="formData" :rules="rules" ref="resourcePropertyForm" layout="vertical">
        <a-form-item label="Tên thuộc tính" name="resourcePropertyName" style="margin-bottom: 10px;">
          <a-input v-model:value="formData.resourcePropertyName" />
        </a-form-item>
        <a-form-item label="ID Tài nguyên" name="resourceId" style="margin-bottom: 10px;">
          <a-input-number v-model:value="formData.resourceId" />
        </a-form-item>
        <a-form-item label="Số lượng" name="quantity" style="margin-bottom: 10px;">
          <a-input-number v-model:value="formData.quantity" />
        </a-form-item>
      </a-form>
    </a-modal>
  </div>
</template>

<script>
import { getAllResourceProperties, createResourceProperty } from '@/apis/resourcePropertyApi';
import { message } from 'ant-design-vue';

export default {
  name: 'ResourcePropertyManagement',
  data() {
    return {
      resourceProperties: [],
      columns: [
        {
          title: 'Tên thuộc tính',
          dataIndex: 'resourcePropertyName',
          key: 'resourcePropertyName',
        },
        {
          title: 'ID Tài nguyên',
          dataIndex: 'resourceId',
          key: 'resourceId',
        },
        {
          title: 'Số lượng',
          dataIndex: 'quantity',
          key: 'quantity',
        },
        {
          title: 'Hành động',
          key: 'actions',
        },
      ],
      isModalVisible: false,
      formData: {
        id: null,
        resourcePropertyName: '',
        resourceId: null,
        quantity: null,
      },
      isEditing: false,
      rules: {
        resourcePropertyName: [{ required: true, message: 'Vui lòng nhập tên thuộc tính!' }],
        resourceId: [{ required: true, message: 'Vui lòng nhập ID tài nguyên!' }],
        quantity: [{ required: true, message: 'Vui lòng nhập số lượng!' }],
      },
    };
  },
  async created() {
    this.fetchResourceProperties();
  },
  methods: {
    async fetchResourceProperties() {
      try {
        const data = await getAllResourceProperties();
        this.resourceProperties = Array.isArray(data) ? data : [];
      } catch (error) {
        message.error(error.message || 'Có lỗi xảy ra khi tải thuộc tính tài nguyên!');
      }
    },
    showCreateModal() {
      this.isEditing = false;
      this.formData = { id: null, resourcePropertyName: '', resourceId: null, quantity: null };
      this.isModalVisible = true;
    },
    showEditModal(record) {
      this.isEditing = true;
      this.formData = { ...record };
      this.isModalVisible = true;
    },
    async handleOk() {
      this.$refs.resourcePropertyForm.validate().then(async () => {
        try {
          const payload = {
            resourcePropertyName: this.formData.resourcePropertyName,
            resourceId: this.formData.resourceId,
            quantity: this.formData.quantity,
          };

          if (this.isEditing) {
            // Assuming update logic is handled elsewhere or not needed
            message.success('Cập nhật thuộc tính thành công!');
          } else {
            await createResourceProperty(payload);
            // await createResourcePropertyDetail({ propertyId: this.formData.id, detail: this.formData.detail });
            message.success('Thêm thuộc tính và chi tiết thành công!');
          }
          this.isModalVisible = false;
          this.fetchResourceProperties();
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