<template>
  <div class="order-management">
    <a-breadcrumb style="margin: 16px 0">
      <a-breadcrumb-item>Trang chủ</a-breadcrumb-item>
      <a-breadcrumb-item>Quản lý đơn hàng</a-breadcrumb-item>
    </a-breadcrumb>
    <a-table
      :columns="columns"
      :dataSource="orders"
      :pagination="{ pageSize: 10 }"
      rowKey="id"
    >
      <template #bodyCell="{ column, record }">
        <span v-if="column.key === 'productImage'">
          <img :src="record.productImage" alt="" class="product-image" />
        </span>
        <span v-else-if="column.key === 'designImage'">
          <img :src="record.designImage" alt="" class="product-image" />
        </span>
        <span v-else>{{ record[column.dataIndex] || "-" }}</span>
      </template>
    </a-table>
  </div>
</template>

<script>
import { getAllOrders } from "@/apis/orderApi"
import { getAllProducts } from "@/apis/productApi"
import { getAllDesigns } from "@/apis/projectApi"
export default {
  name: "OrderManagement",
  data() {
    return {
      orders: [],
      products: [],
      designs: [],
      columns: [
        {
          title: "Tên sản phẩm",
          dataIndex: "productName",
          key: "productName",
        },
        {
          title: "Hình ảnh sản phẩm",
          dataIndex: "productImage",
          key: "productImage",
        },
        {
          title: "Thiết kế",
          dataIndex: "designImage",
          key: "designImage",
        },
        {
          title: "trạng thái",
          dataIndex: "status",
          key: "status",
        },
        {
          title: "Tên người nhận",
          dataIndex: "customerName",
          key: "customerName",
        },
        {
          title: "SĐT người nhận",
          dataIndex: "phoneNumber",
          key: "phoneNumber",
        },
        {
          title: "Địa chỉ người nhận",
          dataIndex: "deliveryAddress",
          key: "deliveryAddress",
        },
        {
          title: "Thời gian tạo đơn",
          dataIndex: "orderDate",
          key: "orderDate",
        },
      ],
    }
  },
  methods: {
    async fetchOrders() {
      try {
        const result = await getAllOrders()
        this.transformOrders(result)
      } catch (error) {
        console.error("Lỗi khi lấy danh sách đơn hàng:", error)
      }
    },
    async fetchProducts() {
      try {
        this.products = await getAllProducts()
        console.log("this.products", this.products)
      } catch (error) {
        console.error("Lỗi khi lấy danh sách sản phẩm:", error)
      }
    },
    async fetchDesigns() {
      try {
        this.designs = await getAllDesigns()
      } catch (error) {
        console.error("Lỗi khi lấy danh sách thiết kế:", error)
      }
    },

    transformOrders(orders) {
      this.orders = orders.map((order) => {
        const product = this.products.find(
          (product) => product.id === order.productID
        )
        const design = this.designs.find(
          (design) => design.id === order.designID
        )
        return {
          productName: product.name ?? "",
          productImage: product.imageUrl ?? "",
          designImage: design.filePath ?? "",
          ...order,
        }
      })
    },
  },
  async mounted() {
    await Promise.all([this.fetchProducts(), this.fetchDesigns()])
    this.fetchOrders()
  },
}
</script>

<style scoped>
.actions-bar {
  display: flex;
  justify-content: space-between;
  margin-bottom: 16px;
}
.product-image {
  height: 100px;
  width: auto;
}
</style>
