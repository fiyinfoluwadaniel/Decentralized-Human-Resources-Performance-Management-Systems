;; HR Department Verification Contract
;; Manages verification and validation of HR departments

;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-already-exists (err u102))
(define-constant err-unauthorized (err u103))

;; Data Variables
(define-data-var next-dept-id uint u1)

;; Data Maps
(define-map hr-departments
  { dept-id: uint }
  {
    name: (string-ascii 100),
    admin: principal,
    verified: bool,
    created-at: uint
  }
)

(define-map dept-admins
  { admin: principal }
  { dept-id: uint }
)

;; Public Functions

;; Register a new HR department
(define-public (register-department (name (string-ascii 100)) (admin principal))
  (let ((dept-id (var-get next-dept-id)))
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (asserts! (is-none (map-get? dept-admins { admin: admin })) err-already-exists)

    (map-set hr-departments
      { dept-id: dept-id }
      {
        name: name,
        admin: admin,
        verified: false,
        created-at: block-height
      }
    )

    (map-set dept-admins
      { admin: admin }
      { dept-id: dept-id }
    )

    (var-set next-dept-id (+ dept-id u1))
    (ok dept-id)
  )
)

;; Verify an HR department
(define-public (verify-department (dept-id uint))
  (let ((dept (unwrap! (map-get? hr-departments { dept-id: dept-id }) err-not-found)))
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)

    (map-set hr-departments
      { dept-id: dept-id }
      (merge dept { verified: true })
    )
    (ok true)
  )
)

;; Read-only Functions

;; Get department info
(define-read-only (get-department (dept-id uint))
  (map-get? hr-departments { dept-id: dept-id })
)

;; Check if admin is verified
(define-read-only (is-verified-admin (admin principal))
  (match (map-get? dept-admins { admin: admin })
    dept-info (match (map-get? hr-departments { dept-id: (get dept-id dept-info) })
      dept (get verified dept)
      false
    )
    false
  )
)

;; Get admin's department ID
(define-read-only (get-admin-dept-id (admin principal))
  (map-get? dept-admins { admin: admin })
)
