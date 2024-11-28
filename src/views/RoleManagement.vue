<template>
  <div>
    <a-breadcrumb style="margin: 16px 0">
      <a-breadcrumb-item>Trang chủ</a-breadcrumb-item>
      <a-breadcrumb-item>Quản lý người dùng</a-breadcrumb-item>
    </a-breadcrumb>
    <a-table
      :columns="columns"
      :dataSource="users"
      :pagination="{ pageSize: 10 }"
      rowKey="id"
    >
      <template #bodyCell="{ column, record }">
        <span v-if="column.key === 'actions'">
          <a-button type="link" @click="showRoleModal(record)">Thêm vai trò</a-button>
        </span>
        <span v-else>{{ record[column.dataIndex] || '-' }}</span>
      </template>
    </a-table>

    <a-modal
      v-model:visible="isRoleModalVisible"
      title="Thêm vai trò"
      @ok="handleAddRoles"
      @cancel="handleCancel"
    >
      <a-select
        mode="tags"
        style="width: 100%"
        placeholder="Nhập vai trò"
        v-model:value="selectedRoles"
      >
        <a-select-option v-for="role in availableRoles" :key="role">{{ role }}</a-select-option>
      </a-select>
    </a-modal>
  </div>
</template>

<script>
import { getAllUsersFromAllUsersApi, addRolesToUser } from '@/apis/userApi';
import { message } from 'ant-design-vue';

export default {
  name: 'RoleManagement',
  data() {
    return {
      users: [],
      columns: [
        {
          title: 'Tên người dùng',
          dataIndex: 'fullName',
          key: 'fullName',
        },
        {
          title: 'Email',
          dataIndex: 'email',
          key: 'email',
        },
        {
          title: 'Số điện thoại',
          dataIndex: 'phoneNumber',
          key: 'phoneNumber',
        },
        {
          title: 'Ngày sinh',
          dataIndex: 'dateOfBirth',
          key: 'dateOfBirth',
        },
        {
          title: 'Thời gian tạo',
          dataIndex: 'createTime',
          key: 'createTime',
        },
        {
          title: 'Thời gian cập nhật',
          dataIndex: 'updateTime',
          key: 'updateTime',
        },
        {
          title: 'ID Đội nhóm',
          dataIndex: 'teamId',
          key: 'teamId',
        },
        {
          title: 'Vai trò',
          dataIndex: 'roles',
          key: 'roles',
          customRender: ({ text }) => text.join(', '),
        },
        {
          title: 'Hành động',
          key: 'actions',
        },
      ],
      isRoleModalVisible: false,
      selectedRoles: [],
      currentUserId: null,
      availableRoles: ['Admin', 'User', 'Employee', 'Designer', 'Shipper'], 
    };
  },
  async created() {
    this.fetchUsers();
  },
  methods: {
    async fetchUsers() {
      try {
        const data = await getAllUsersFromAllUsersApi();
        this.users = Array.isArray(data) ? data : [];
      } catch (error) {
        message.error(error.message || 'Có lỗi xảy ra khi tải người dùng!');
      }
    },
    showRoleModal(record) {
      this.currentUserId = record.id;
      this.selectedRoles = record.roles || [];
      this.isRoleModalVisible = true;
    },
    async handleAddRoles() {
      try {
        await addRolesToUser(this.currentUserId, this.selectedRoles);
        message.success('Thêm vai trò thành công!');
        this.isRoleModalVisible = false;
        this.fetchUsers();
      } catch (error) {
        message.error(error.message || 'Có lỗi xảy ra khi thêm vai trò!');
      }
    },
    handleCancel() {
      this.isRoleModalVisible = false;
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

h1{
  margin-top: 25px;
}
</style> 