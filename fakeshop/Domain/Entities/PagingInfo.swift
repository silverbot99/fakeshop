//
//  PagingInfo.swift
//  fakeshop
//
//  Created by Admin on 31/03/2023.
//

//Model for paging view
public struct PagingInfo<T> {
    public var page: Int
    public var items: [T]
    public var hasMorePages: Bool
    public var totalItems: Int
    public var itemsPerPage: Int
    public var totalPages: Int
    
    public init(page: Int,
                items: [T],
                hasMorePages: Bool,
                totalItems: Int,
                itemsPerPage: Int,
                totalPages: Int) {
        self.page = page
        self.items = items
        self.hasMorePages = hasMorePages
        self.totalItems = totalItems
        self.itemsPerPage = itemsPerPage
        self.totalPages = totalPages
    }
    
    public init(page: Int, items: [T], hasMorePages: Bool) {
        self.init(page: page,
                  items: items,
                  hasMorePages: hasMorePages,
                  totalItems: 0,
                  itemsPerPage: 0,
                  totalPages: 0)
    }
    
    public init(page: Int, items: [T]) {
        self.init(page: page,
                  items: items,
                  hasMorePages: true,
                  totalItems: 0,
                  itemsPerPage: 0,
                  totalPages: 0)
    }
    
    public init() {
        self.init(page: 1,
                  items: [],
                  hasMorePages: true,
                  totalItems: 0,
                  itemsPerPage: 0,
                  totalPages: 0)
    }
}

extension PagingInfo: Equatable where T: Equatable {
    
}
