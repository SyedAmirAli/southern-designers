import axios from 'axios';
import { reactive } from 'vue';
import { toast } from 'vue3-toastify';

/**
 * @function New-Axios-Instance '
 * @description My new Axios Configuration and set authorization header
 * @exports fetchWithAxios new function for fetching data.
 */
const createAxiosInstance = axios.create({
    baseURL: 'route' in window ? window.route('/frontend') : '', // Corrected baseURL instead of url
    headers: {
        Accept: 'application/json',
    },
    withCredentials: true,
    xsrfHeaderName: 'X-XSRF-TOKEN',
});
createAxiosInstance.interceptors.request.use(
    (config) => {
        try {
            const user = localStorage.getItem('user');

            if (user) {
                const token = JSON.parse(user)?.token;
                if (token) config.headers.Authorization = `Bearer ${token}`;
            }

            return config;
        } catch (error) {
            return config;
        }
    },
    (error) => {
        return Promise.reject(error);
    }
);

export default function ({
    endpoint,
    method = 'GET',
    body = {},
    headers = {},
}) {
    const state = reactive({
        isLoading: false,
        isSuccess: false,
        isError: false,
        error: undefined,
        data: null,
    });

    async function fetchWithAxios(config = null) {
        const checker = (key) => Object.isExtensible(config) && key in config;

        let newEndpoint = endpoint;
        if (config && typeof config === 'string') {
            newEndpoint = config;
        }
        if (Object.isExtensible(config) && 'endpoint' in config) {
            newEndpoint = config.endpoint;
        }

        const newMethod = checker('method') ? config.method : method;
        const newHeaders = checker('headers') ? config.headers : headers;
        const newBody = checker('body') ? config.body : body;
        const updateData = checker('update') ? config.update : true;

        state.isLoading = true;
        state.isError = false;
        state.isSuccess = false;

        try {
            const response = await createAxiosInstance({
                url: newEndpoint,
                method: newMethod,
                data: newBody,
                headers: newHeaders,
            });

            if (method !== 'GET') {
                if (response.data?.status === 'success') {
                    toast.success(response.data?.message);
                } else if (response.status === 200) {
                    toast.success('Success! Nice Work.');
                } else toast.error('Error! Something went wrong.', 'error');
            }

            state.isLoading = false;
            state.isError = false;
            state.isSuccess = true;
            state.error = undefined;

            if (updateData) {
                state.data = response.data;
            }

            if ('info' in window) {
                window.info({
                    [`AXIOS RESPONSE - ${newEndpoint} - ${newMethod}`]:
                        response,
                });
            }

            if (!['GET', 'get', 'HEAD', 'head'].includes(newMethod)) {
                if (response.data?.status && response.data?.message) {
                    if (response.data?.status in toast) {
                        toast[response.data?.status](response.data?.message);
                    } else toast.success(response.data?.message);
                } else toast.success('Success! Nice Work.');
            }

            return response.data;
        } catch (axiosError) {
            state.isLoading = false;
            state.isSuccess = false;
            state.isError = true;
            state.error = axiosError?.response;

            if ('info' in window) {
                window.info('AXIOS ERROR:', axiosError);
            }

            // Handling Toast
            if (
                axiosError?.response?.status !== 422 &&
                typeof axiosError?.response?.data?.message === 'string'
            ) {
                toast.error(axiosError?.response?.data?.message);
                throw new Error(`Failed to show error message.`);
            }

            if ([409, 422].includes(axiosError?.response?.status)) {
                const errRes = axiosError?.response?.data;
                if (Object.isExtensible(errRes?.errors)) {
                    const err = Object.values(errRes?.errors);

                    if (Array.isArray(err)) {
                        err?.forEach((e) => {
                            toast.warn(e);
                        });
                    } else toast.error(errRes?.message, 'error');
                } else toast.error(errRes?.message, 'error');
            } else toast.error('Error! Something went wrong.', 'error');

            throw new Error(`Failed to load.`);
        } finally {
            state.isLoading = false;
        }
    }
    return { state, fetchWithAxios };
}
