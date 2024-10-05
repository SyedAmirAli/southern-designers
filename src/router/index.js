import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import SusTainibilityView from '@/views/SusTainibilityView.vue';
import ProductView from '@/views/ProductView.vue';
import ContactView from '@/views/ContactView.vue';
import MediaView from '@/views/MediaView.vue';
import CategoryProductsView from '@/views/CategoryProductsView.vue';

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: '/',
            name: 'home',
            component: HomeView,
        },
        {
            path: '/sustainability',
            name: 'SusTainibilityView',
            component: SusTainibilityView,
        },
        {
            path: '/product',
            name: 'ProductView',
            component: ProductView,
        },
        {
            path: '/product/:slug',
            name: 'CategoryProductsView',
            component: CategoryProductsView,
        },
        {
            path: '/contact',
            name: 'ContactView',
            component: ContactView,
        },
        {
            path: '/media',
            name: 'MediaView',
            component: MediaView,
        },
        {
            path: '/about',
            name: 'AboutView',
            component: () => import('../views/AboutView.vue'),
        },
    ],
});

export default router;
