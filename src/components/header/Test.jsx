import { ref } from 'vue';

export default function Test() {
    const hello = ref('I am hello from vue jsx');
    return <div>{hello.value}</div>;
}
