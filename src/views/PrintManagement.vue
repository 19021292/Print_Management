<template>
  <div>
    <a-breadcrumb style="margin: 16px 0">
      <a-breadcrumb-item>Trang chủ</a-breadcrumb-item>
      <a-breadcrumb-item>Quản lý in ấn</a-breadcrumb-item>
    </a-breadcrumb>
    <a-table
      :dataSource="printJobs"
      :columns="columns"
      :pagination="{ pageSize: 10 }"
      rowKey="id"
      class="design-table"
    >
      <template #bodyCell="{ column, record }">
        <span v-if="column.key === 'action'">
          <a-button
            type="primary"
            @click="confirmDesignForPrinting(record)"
            :disabled="record.printJobStatus === 'Confirmed'"
          >
            Kết thúc
          </a-button>
        </span>
        <span v-else>{{ record[column.dataIndex] || '-' }}</span>
      </template>
    </a-table>
    <a-modal
      v-model:visible="isModalVisible"
      title="Kết thúc Dự án"
      @ok="handleConfirm"
      @cancel="handleCancel"
    >
      <p>Bạn có chắc chắn muốn kết thúc dự án này?</p>
    </a-modal>
  </div>
</template>

<script>
import { getAllPrintJobs, confirmDesignForPrinting as apiConfirmDesignForPrinting } from '@/apis/projectApi';
import { message } from 'ant-design-vue';

export default {
  name: 'PrintManagement',
  data() {
    return {
      printJobs: [],
      columns: [
        {
          title: 'ID',
          dataIndex: 'id',
          key: 'id',
        },
        {
          title: 'ID Thiết kế',
          dataIndex: 'designId',
          key: 'designId',
        },
        {
          title: 'Trạng thái công việc in',
          dataIndex: 'printJobStatus',
          key: 'printJobStatus',
        },
        {
          title: 'Hành động',
          dataIndex: 'action',
          key: 'action',
        },
      ],
      isModalVisible: false,
      designIdToConfirm: null,
    };
  },
  async created() {
    this.fetchPrintJobs();
  },
  methods: {
    async fetchPrintJobs() {
      try {
        const data = await getAllPrintJobs();
        this.printJobs = data;
      } catch (error) {
        message.error(error.message || 'Có lỗi xảy ra khi tải công việc in!');
      }
    },
    confirmDesignForPrinting(record) {
      this.designIdToConfirm = record.designId; // Use the designId from the clicked row
      this.isModalVisible = true;
    },
    async handleConfirm() {
      try {
        await apiConfirmDesignForPrinting(this.designIdToConfirm); // Pass designId to the API
        message.success('Dự án đã được xác nhận cho in ấn thành công!');
      } catch (error) {
        message.error(error.message || 'Có lỗi xảy ra khi xác nhận dự án!');
      } finally {
        this.isModalVisible = false;
      }
    },
    handleCancel() {
      this.isModalVisible = false;
    },
  },
};
</script>

<style scoped>
/* Add your styles here */
</style>