import type { Order } from './order';
import * as ordersMock from './orders.json'

const orders: Order[] = ordersMock;

const getOrders = () => orders;

const updateOrder = (orderId: string, valuesToUpdate: Partial<Order>) => {
    const orderIndex = orders.findIndex((order) => order.id === orderId);

    if (orderIndex === -1) {
        throw new Error(`Order #${orderId} not found`);
    }

    const updatedOrder = { ...orders[orderIndex], ...valuesToUpdate }
    orders.splice(orderIndex, 1, updatedOrder);

    return updatedOrder;
}

export {
    getOrders,
    updateOrder,
}
