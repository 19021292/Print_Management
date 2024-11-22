<template>
  <a-layout-sider v-model:collapsed="collapsed" collapsible width="200" class="site-layout-background">
    <a-menu
      mode="inline"
      :default-selected-keys="[selectedKey]"
      style="height: 100%; border-right: 0"
    >
      <a-menu-item v-for="item in menuItems" :key="item.key">
        <router-link :to="item.route">{{ item.label }}</router-link>
      </a-menu-item>
    </a-menu>
  </a-layout-sider>
</template>

<script>
export default {
  name: 'AppSidebar',
  computed: {
    selectedKey() {
      const path = this.$route.path;
      if (path === '/') return '1';
      if (path === '/categories') return '5';
      return '1';
    },
    menuItems() {
      const role = localStorage.getItem('roles') || '';
      
      // Log the role
      console.log(role.trim().replace(/"/g, ''));
      
      const roleMenuMap = {
        "User": [
          { key: '9', label: 'Quản lý dự án', route: '/project-management' },
          { key: '10', label: 'Quản lý in', route: '/print-management' },
          { key: '11', label: 'Quản lý thiết kế', route: '/design-management' }]
        ,
        "Admin": [
          { key: '6', label: 'Quản lý đội ngũ', route: '/team' },
          { key: '7', label: 'Quản lý vai trò', route: '/roles' },
          { key: '8', label: 'Quản lý tài nguyên', route: '/resources' },
          { key: '9', label: 'Quản lý dự án', route: '/project-management' }
        ],
        "Employee": [{ key: '3', label: 'Employee Area', route: '/employee' }],
        "Designer": [{ key: '4', label: 'Designer Tools', route: '/designer' }],
        "Shipper": [{ key: '5', label: 'Shipper Zone', route: '/shipper' }],
      };

      console.log(roleMenuMap[role.trim()]);

      // Return the menu items for the single role
      return roleMenuMap[role.trim().replace(/"/g, '')] || [];
    },
  },
};
</script>

<style scoped>
</style>