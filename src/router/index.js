import { createRouter, createWebHistory } from 'vue-router';
import LoginView from '@/views/LoginView.vue';
import UserManagement from '@/views/UserManagement.vue';
import TeamManagement from '@/views/TeamManagement.vue';
import RoleManagement from '@/views/RoleManagement.vue';
import ResourceManagement from '@/views/ResourceManagement.vue';
import ProjectManagement from '@/views/ProjectManagement.vue'; // Added ProjectManagement
import PrintManagement from '@/views/PrintManagement.vue'; // Added PrintManagement
import DesignManagement from '@/views/DesignManagement.vue'; // Added DesignManagement

const routes = [
  { path: '/login', name: 'Login', component: LoginView },
  { path: '/users', name: 'Users', component: UserManagement },
  { path: '/team', name: 'Team', component: TeamManagement },
  { path: '/roles', name: 'Roles', component: RoleManagement },
  { path: '/resources', name: 'Resources', component: ResourceManagement },
  { path: '/project-management', name: 'ProjectManagement', component: ProjectManagement }, // Added ProjectManagement route
  { path: '/print-management', name: 'PrintManagement', component: PrintManagement }, // Added PrintManagement route
  { path: '/design-management', name: 'DesignManagement', component: DesignManagement }, // Added DesignManagement route
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

router.beforeEach((to, from, next) => {
  const publicPages = ['/login'];
  const authRequired = !publicPages.includes(to.path);
  const loggedIn = localStorage.getItem('user');

  if (authRequired && !loggedIn) {
    return next('/login');
  }

  next();
});

export default router;